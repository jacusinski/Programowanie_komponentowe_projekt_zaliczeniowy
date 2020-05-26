package net.benedykt.room.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.benedykt.room.dao.RoomDAO;
import net.benedykt.room.model.Room;

@Controller
public class MainController {

	@Autowired
	private RoomDAO roomDAO;
		
	@RequestMapping(value = "/")
	public ModelAndView listRoom(ModelAndView model) {
		List<Room> listRoom = roomDAO.list();
		model.addObject("listRoom", listRoom);
		model.setViewName("index");
		
		return model;
	}

	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView newRoom(ModelAndView model) {
		Room newRoom = new Room();

		model.addObject("room", newRoom);
		model.setViewName("room_form");
		
		return model;
	}
	
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public ModelAndView saveRoom(@ModelAttribute Room room) {
		if(room.getRoomId() == null) {
			roomDAO.save(room);
		} else {
			roomDAO.update(room);
		}
		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView editRoom(HttpServletRequest request) {
		Integer roomId = Integer.parseInt(request.getParameter("roomId"));
		Room room = roomDAO.get(roomId);
		
		ModelAndView model = new ModelAndView("room_form");
		model.addObject("room", room);
		
		return model;
	} 

	
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public ModelAndView deleteRoom(@RequestParam Integer roomId) {
		roomDAO.delete(roomId);
		
		return new ModelAndView("redirect:/");
	}
	

	
	
}
