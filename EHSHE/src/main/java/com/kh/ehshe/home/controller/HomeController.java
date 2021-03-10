package com.kh.ehshe.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ehshe.home.model.service.HomeService;
import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.PlaceInfo;
import com.kh.ehshe.home.model.vo.TopItem;
import com.kh.ehshe.home.model.vo.TopPlace;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private HomeService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		List<TopItem> tList = service.selectTopList();
		// System.out.println(tList);

		List<Item> iList = service.selectItemList(tList);
		// System.out.println(iList);

		List<TopPlace> tpList = service.selectTopPlaceList();
		// System.out.println(tpList);

		List<PlaceInfo> piList = service.selectPlaceInfoList(tpList);
		// System.out.println(piList);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("tList", tList);
		model.addAttribute("iList", iList);
		model.addAttribute("tpList", tpList);
		model.addAttribute("piList", piList);

		return "common/main";
	}

}
