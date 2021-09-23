package tw.store.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.store.model.Store;
import tw.store.model.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeservice;

	public String userid;
	public String company;
	public ArrayList<String> userids;

	public String saveDir;

	public Store store;
	public byte[] photo;

	// 1.店家首頁入口[indexStroeEntry.controller]

	@SuppressWarnings("unchecked")
	@RequestMapping(path = "/indexStroeEntry.controller", method = { RequestMethod.POST, RequestMethod.GET })
	public String indexStroeEntry(HttpServletRequest request, Model m, MultipartFile multipartFile) throws IOException {

		// 拿帳號、統編、相關店家帳號
		userid = (String) request.getSession().getAttribute("userid");
		company = (String) request.getSession().getAttribute("company");
		userids = (ArrayList<String>) request.getSession().getAttribute("userids");
		saveDir = (String) request.getSession().getAttribute("saveDir");

		ArrayList<Store> storeList = new ArrayList<Store>();

		// 查詢其他分店資料並且輸出至目錄資料夾
		for (String userid : userids) {

			Store stores = storeservice.queryByuserid(userid);

			if (stores != null) {

				storeList.add(stores);

				// 判斷是否有新增過圖片
				if (stores.getPhoto() != null) {

					// 判斷是否有新增過圖片目錄資料夾
					if (saveDir == null || saveDir.isEmpty()) {
						// 創目錄資料夾
						saveDir = request.getSession().getServletContext().getRealPath("/") + "StoreIMG\\";
						File saveDirFile = new File(saveDir);
						saveDirFile.mkdirs();
					}
					// 輸出圖片
					String fileName = stores.getStuserid();
					String saveFilePath = saveDir + fileName;
					File saveFile = new File(saveFilePath);

					FileImageOutputStream imageOutput = new FileImageOutputStream(saveFile);
					imageOutput.write(stores.getPhoto(), 0, stores.getPhoto().length);
					imageOutput.close();
				}
			}

		}

		// 查詢店家帳號資料
		store = storeservice.queryByuserid(userid);
		// 存入店家資料
		request.getSession().setAttribute("store", store);
		// 存入其他分店店家資料
		request.getSession().setAttribute("storeList", storeList);

		// 顯示在首頁上尚未新增資料
		if (store == null) {
			m.addAttribute("nullmsg", "尚未新增");

			return "storePages/storeIndex.jsp";
		}

		// 取圖片資料
		photo = store.getPhoto();

		// 判斷是否有新增過圖片
		if (store.getPhoto() != null) {

			// 判斷是否有新增過圖片目錄資料夾
			if (saveDir == null || saveDir.isEmpty()) {
				// 創目錄資料夾
				saveDir = request.getSession().getServletContext().getRealPath("/") + "StoreIMG\\";
				File saveDirFile = new File(saveDir);
				saveDirFile.mkdirs();
			}
			// 輸出圖片
			String fileName = store.getStuserid();
			String saveFilePath = saveDir + fileName;
			File saveFile = new File(saveFilePath);

			FileImageOutputStream imageOutput = new FileImageOutputStream(saveFile);
			imageOutput.write(store.getPhoto(), 0, store.getPhoto().length);
			imageOutput.close();
		}
		return "storePages/storeIndex.jsp";
	}

	// 2.新增店家入口 [storeInsertEntry.controller]
	@RequestMapping(path = "/storeInsertEntry.controller", method = RequestMethod.POST)
	public String insertProcessEntry(Model m) {

		// 已經新增過資料，執行查詢
		if (store != null) {

			if (store.getPhoto() == null || store.getTitle() == null || store.getTel() == null
					|| store.getStadd() == null || store.getManager() == null || store.getIntro() == null) {
				m.addAttribute("nullNewMsg", "未輸入資料的欄位或上傳圖片,請至【修改】新增資料內容");
			}

			return "storePages/storeInsertQuery.jsp";
		}
		return "storePages/storeInsert.jsp";
	}

	// 3.執行新增 [storeInsertAction.controller]
	@RequestMapping(path = "/storeInsertAction.controller", method = RequestMethod.POST)
	public String insertProcessAction(@ModelAttribute(name = "storeItem") Store store, BindingResult bind,
			@RequestParam(name = "photo") MultipartFile multipartFile, Model m, HttpServletRequest request)
			throws IllegalStateException, IOException {

		// 判斷是否有上傳圖片
		if (multipartFile.getSize() != 0) {

			// 圖片處理及儲存
			String fileName = multipartFile.getOriginalFilename();

			// 已經新增過目錄資料夾，從session取出
			saveDir = (String) request.getSession().getAttribute("saveDir");

			// 判斷是否有新增過圖片目錄資料夾
			if (saveDir == null || saveDir.isEmpty()) {
				saveDir = request.getSession().getServletContext().getRealPath("/") + "StoreIMG\\";
				// 將目錄路徑存session
				request.getSession().setAttribute("saveDir", saveDir);
				// 執行新增目錄資料夾
				File saveDirFile = new File(saveDir);
				saveDirFile.mkdirs();
			}

			String saveFilePath = saveDir + fileName;
			File saveFile = new File(saveFilePath);
			multipartFile.transferTo(saveFile);

			// 圖片轉byte[]
			byte[] pic = processPicture(saveFilePath);
			request.getSession().setAttribute("photo", pic);

			// 將圖片更新JavaBean
			store.setPhoto(pic);

			// 將圖片檔名傳出
			request.getSession().setAttribute("fileName", fileName);
		}

		// 帳號放進store
		store.setStuserid(userid);

		// 新增資料
		storeservice.insert(store);

		// 導至成功頁面
		m.addAttribute("store", store);
		return "storePages/storeInsertSuccess.jsp";

	}

	// 4.修改方法入口
	@RequestMapping(path = "/storeUpdateEntry.controller", method = RequestMethod.POST)
	public String UpdateProcessEntry(Model m) {

		// 尚未新增過資料
		if (store == null) {
			m.addAttribute("nullupdate", "無店家資料，請先至【新增/查詢】新增店家資料");
			return "/indexStroeEntry.controller";
		}

		// 已經新增過資料，執行查詢
		return "storePages/storeUpdate.jsp";
	}

	// 5.執行修改方法
	@RequestMapping(path = "/storeUpdateAction.controller", method = RequestMethod.POST)
	public String storeUpdateAction(@ModelAttribute(name = "storeItem") Store store, BindingResult bind,
			@RequestParam(name = "photo") MultipartFile multipartFile, Model m, HttpServletRequest request)
			throws IllegalStateException, IOException {

		// 判斷是否有上傳圖片
		if (multipartFile.getSize() != 0) {

			// 圖片處理及儲存
			String fileName = multipartFile.getOriginalFilename();

			// 已經新增過目錄資料夾，從session取出
			saveDir = (String) request.getSession().getAttribute("saveDir");

			// 判斷是否有新增過圖片目錄資料夾
			if (saveDir == null || saveDir.isEmpty()) {
				saveDir = request.getSession().getServletContext().getRealPath("/") + "StoreIMG\\";
				// 將目錄路徑存session
				request.getSession().setAttribute("saveDir", saveDir);
				// 執行新增目錄資料夾
				File saveDirFile = new File(saveDir);
				saveDirFile.mkdirs();
			}

			String saveFilePath = saveDir + fileName;
			File saveFile = new File(saveFilePath);
			multipartFile.transferTo(saveFile);

			// 圖片轉byte[]
			byte[] pic = processPicture(saveFilePath);
			request.getSession().setAttribute("photo", pic);

			// 將圖片更新JavaBean
			store.setPhoto(pic);
		} else {
			store.setPhoto(photo);
		}

		// 帳號放進store
		store.setStuserid(userid);

		// 更新資料
		storeservice.updateItemByStuid(store);

		// 導至成功頁面
		m.addAttribute("OKmsg", "店家資料修改成功");
		return "indexStroeEntry.controller";

	}

	// 6.刪除方法入口
	@RequestMapping(path = "/storeDeleteEntry.controller", method = RequestMethod.POST)
	public String DeleteProcessEntry(Model m, HttpServletRequest request) {

		// 尚未新增過資料
		if (store == null) {
			m.addAttribute("nulldelete", "無店家資料，無法執行刪除");
			return "/indexStroeEntry.controller";
		}

		// 已經新增過資料，執行刪除

		boolean sta = storeservice.deleteByStuid(store.getStuserid());
		if (sta) {
			m.addAttribute("OKmsg", "店家資料刪除成功");
		}

		return "indexStroeEntry.controller";
	}

	// 方法一：圖片轉成byte
	public byte[] processPicture(String saveFilePath) throws IOException {

		FileInputStream is1 = new FileInputStream(saveFilePath);
		byte[] b = new byte[is1.available()];
		is1.read(b);
		is1.close();

		return b;
	}

}
