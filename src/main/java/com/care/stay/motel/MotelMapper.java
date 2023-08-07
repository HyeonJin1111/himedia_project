package com.care.stay.motel;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
public interface MotelMapper {
	ArrayList<MotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	void stayregisterProc(MotelDTO motel);
	MotelDTO stayContent(int no);
	MotelRoomDTO stayRoomContent(int no);
	MotelDTO stayDetailRegister(int no);
	void staydetailregisterProc(MotelRoomDTO motelroom);
	int stayCountMotel();
	List<MotelRoomDTO> stayRoomContent(String n);
	
	
}
