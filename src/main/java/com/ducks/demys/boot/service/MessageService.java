package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.MessageRepository;
import com.ducks.demys.boot.vo.Message;

@Service
public class MessageService {
	
	private MessageRepository messageRepository;
	
	public MessageService(MessageRepository messageRepository) {
		this.messageRepository= messageRepository;
	}
	
	public List<Message> getMessageListByMEMBER_NUM(int MEMBER_NUM){
		return messageRepository.getMessageListByMEMBER_NUM(MEMBER_NUM);
	}
	
	public Message getMessageByMSG_NUM(int MSG_NUM){
		return messageRepository.getMessageByMSG_NUM(MSG_NUM);
	}
	
	public void registMessage(Message Message) {
		Message.setMSG_NUM(messageRepository.selectMessageSequenceNextValue());
		messageRepository.registMessage(Message);
	}
	
	public void modifyMessage(Message Message) {
		messageRepository.modifyMessage(Message);
	}
	
	public void removeMessage(int MB_NUM) {
		messageRepository.removeMessage(MB_NUM);
	}
}
