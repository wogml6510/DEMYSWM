package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Message;

@Mapper
public interface MessageRepository {

	public List<Message> getMessageListByMEMBER_NUM(int MEMBER_NUM);
	
	public Message getMessageByMSG_NUM(int MSG_NUM);
	
	public int selectMessageSequenceNextValue();
	
	public void registMessage(Message msg);
	
	public void modifyMessage(Message msg);
	
	public void removeMessage(int MSG_NUM);
	
}