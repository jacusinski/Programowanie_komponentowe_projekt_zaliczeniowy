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

import net.benedykt.room.dao.BuildingDAO;
import net.benedykt.room.dao.LightPointDAO;
import net.benedykt.room.dao.RoomDAO;
import net.benedykt.room.dao.UserDAO;
import net.benedykt.room.model.Building;
import net.benedykt.room.model.LightPoint;
import net.benedykt.room.model.Room;
import net.benedykt.room.model.User;

@Controller
public class MainController {

	@Autowired
	private BuildingDAO buildingDAO;
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private LightPointDAO lightPointDAO;
	@Autowired
	private UserDAO userDAO;


	//////////     LISTING FORMS    ////////////////////////////////////

	@RequestMapping(value = "/")
	public ModelAndView listRoom(ModelAndView model) {
		List<Room> listRoom = roomDAO.list();
		model.addObject("listRoom", listRoom);
		model.setViewName("index");
		
		return model;
	}
	
	
	@RequestMapping(value = "/list_building")
	public ModelAndView listBuilding(ModelAndView model) {
		List<Building> listBuilding = buildingDAO.list();
		model.addObject("listBuilding", listBuilding);
		model.setViewName("building_list");
		
		return model;
	}

	
	@RequestMapping(value = "/list_lightPoint")
	public ModelAndView lightPoint(ModelAndView model) {
		List<LightPoint> listLightPoint = lightPointDAO.list();
		model.addObject("listLightPoint", listLightPoint);
		model.setViewName("light_point_list");
		
		return model;
	}
	
	
	@RequestMapping(value = "/list_room")
	public ModelAndView room(ModelAndView model) {
		List<Room> listRoom = roomDAO.list();
		model.addObject("listRoom", listRoom);
		model.setViewName("room_list");
		
		return model;
	}
	
	
	@RequestMapping(value = "/list_user")
	public ModelAndView user(ModelAndView model) {
		List<User> listUser = userDAO.list();
		model.addObject("listUser", listUser);
		model.setViewName("user_list");
		
		return model;
	}
	
	
	//////////     PICKING FORMS    ////////////////////////////////////
	
	
	@RequestMapping(value = "/pick_a_user", method = RequestMethod.GET)
	public ModelAndView pickAUser(ModelAndView model) {
		User newUser = new User();

		model.addObject("user", newUser);
		model.setViewName("pick_a_user_form");
		
		return model;
	}
	
	
	@RequestMapping(value = "/pick_a_user_building", method = RequestMethod.GET)
	public ModelAndView pickAUserBuilding(ModelAndView model) {
		User newUser = new User();

		model.addObject("user", newUser);
		model.setViewName("pick_a_user_building_form");
		
		return model;
	}
	
	
	
	@RequestMapping(value = "/pick_a_user_building_room", method = RequestMethod.GET)
	public ModelAndView pickAUserBuildingRoom(ModelAndView model) {
		User newUser = new User();

		model.addObject("user", newUser);
		model.setViewName("pick_a_user_building_form");
		
		return model;
	}
	
	
	//////////     NEW FORMS    ////////////////////////////////////
	
	
	@RequestMapping(value = "/new_building", method = RequestMethod.GET)
	public ModelAndView newBuilding(ModelAndView model) {
		Building newBuilding = new Building();

		model.addObject("building", newBuilding);
		model.setViewName("building_form");
		
		return model;
	}

	
	@RequestMapping(value = "/new_lightPoint", method = RequestMethod.GET)
	public ModelAndView newLightPoint(ModelAndView model) {
		LightPoint newLightPoint = new LightPoint();

		model.addObject("lightPoint", newLightPoint);
		model.setViewName("light_point_form");
		
		return model;
	}
	
	
	@RequestMapping(value = "/new_room", method = RequestMethod.GET)
	public ModelAndView newRoom(ModelAndView model) {
		Room newRoom = new Room();

		model.addObject("room", newRoom);
		model.setViewName("room_form");
		
		return model;
	}

	
	@RequestMapping(value = "/new_user", method = RequestMethod.GET)
	public ModelAndView newUser(ModelAndView model) {
		User newUser = new User();

		model.addObject("user", newUser);
		model.setViewName("user_form");
		
		return model;
	}


	
	//////////     SAVE FORMS    ////////////////////////////////////

	@RequestMapping(value="/save_building", method = RequestMethod.POST)
	public ModelAndView saveBuilding(@ModelAttribute Building building) {
		if(building.getBuildingId() == null) {
			buildingDAO.save(building);
		} else {
			buildingDAO.update(building);
		}
		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value="/save_lightPoint", method = RequestMethod.POST)
	public ModelAndView saveLightPoint(@ModelAttribute LightPoint lightPoint) {
		if(lightPoint.getLightPointId() == null) {
			lightPointDAO.save(lightPoint);
		} else {
			lightPointDAO.update(lightPoint);
		}
		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value="/save_room", method = RequestMethod.POST)
	public ModelAndView saveRoom(@ModelAttribute Room room) {
		if(room.getRoomId() == null) {
			roomDAO.save(room);
		} else {
			roomDAO.update(room);
		}
		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value="/save_user", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user) {
		if(user.getUserId() == null) {
			userDAO.save(user);
		} else {
			userDAO.update(user);
		}
		return new ModelAndView("redirect:/");
	}
	
	

	//////////     EDIT FORMS    ////////////////////////////////////
	
	@RequestMapping(value="/edit_building", method = RequestMethod.GET)
	public ModelAndView editBuilding(HttpServletRequest request) {
		Integer buildingId = Integer.parseInt(request.getParameter("buildingId"));
		Building building = buildingDAO.get(buildingId);
		
		ModelAndView model = new ModelAndView("building_form");
		model.addObject("building", building);
		
		return model;
	} 

	
	@RequestMapping(value="/edit_lightPoint", method = RequestMethod.GET)
	public ModelAndView editLightPoint(HttpServletRequest request) {
		Integer lightPointId = Integer.parseInt(request.getParameter("lightPointId"));
		LightPoint lightPoint = lightPointDAO.get(lightPointId);
		
		ModelAndView model = new ModelAndView("light_point_form");
		model.addObject("lightPoint", lightPoint);
		
		return model;
	} 
	
	
	@RequestMapping(value="/edit_room", method = RequestMethod.GET)
	public ModelAndView editRoom(HttpServletRequest request) {
		Integer roomId = Integer.parseInt(request.getParameter("roomId"));
		Room room = roomDAO.get(roomId);
		
		ModelAndView model = new ModelAndView("room_form");
		model.addObject("room", room);
		
		return model;
	} 

	
	@RequestMapping(value="/edit_user", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request) {
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		User user = userDAO.get(userId);
		
		ModelAndView model = new ModelAndView("user_form");
		model.addObject("user", user);
		
		return model;
	} 

	
	
	//////////     DELETE FORMS    ////////////////////////////////////

	@RequestMapping(value="/delete_building", method = RequestMethod.GET)
	public ModelAndView deleteBuilding(@RequestParam Integer buildingId) {
		buildingDAO.delete(buildingId);
		
		return new ModelAndView("redirect:/");
	}
	
	

	@RequestMapping(value="/delete_lightPoint", method = RequestMethod.GET)
	public ModelAndView deleteLightPoint(@RequestParam Integer lightPointId) {
		lightPointDAO.delete(lightPointId);
		
		return new ModelAndView("redirect:/");
	}
	

	@RequestMapping(value="/delete_room", method = RequestMethod.GET)
	public ModelAndView deleteRoom(@RequestParam Integer roomId) {
		roomDAO.delete(roomId);
		
		return new ModelAndView("redirect:/");
	}


	@RequestMapping(value="/delete_user", method = RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam Integer userId) {
		userDAO.delete(userId);
		
		return new ModelAndView("redirect:/");
	}
	
}
