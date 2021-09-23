package activity.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityService {
	
	@Autowired
	private ActivityDao activityDao;

	// 新增一筆活動
	public void insertActivity( ActivityBean activityBean ) {
		activityDao.insertActivity(activityBean);
	}

	// 查詢所有活動
	public List<ActivityBean> queryAllActivity() {
		List<ActivityBean> result = activityDao.queryAllActivity();
		return result;
	}

	// 查詢單一活動
	public ActivityBean queryOneActivity(int ID) {
		ActivityBean result = activityDao.queryOneActivity(ID);
		return result;
	}
	
	// 修改活動
	public void updateActivity(ActivityBean activityBean) {
		System.out.println("經過Update.Service");
		activityDao.updateActivity(activityBean);
	}
	
	// 刪除活動
	public void deleteActivity(int ID) {
		activityDao.deleteActivity(ID);
	}
	
	
}
