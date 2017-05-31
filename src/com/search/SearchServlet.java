package com.search;

import java.util.*;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class SearchServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static List<String> datas = new ArrayList<String>();
	static{
		
		datas.add("ajax");
		datas.add("ajax project");
		datas.add("back");
		datas.add("abc");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//System.out.println("123");
		String keyword = request.getParameter("keyword");
		List<String> listData = getData(keyword);
		//System.out.println(JSONArray.fromObject(listData));
		response.getWriter().write(JSONArray.fromObject(listData).toString());
	}
	
	public List<String> getData(String keyword){
		List<String> list = new ArrayList<String>();
		for(String data:datas){
			if(data.contains(keyword)){
				list.add(data);
			}
		}
		
		return list;
	}

}
