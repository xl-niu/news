package cn.zq.service;

import cn.zq.common.pojo.PageData;

import java.util.List;

public interface MeetingService {

    List<PageData> getDayMeeting(String day);
}
