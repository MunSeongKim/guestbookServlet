package com.cafe24.guestbook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cafe24.guestbook.dao.GuestbookDAO;
import com.cafe24.guestbook.vo.GuestbookVO;
import com.cafe24.mvc.util.WebUtil;

@WebServlet( "/board" )
public class GuestbookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet( HttpServletRequest request, HttpServletResponse response )
	    throws ServletException, IOException {
	request.setCharacterEncoding( "UTF-8" );

	String actionName = request.getParameter( "a" );
	if ( "deleteform".equals( actionName ) ) {
	    String no = request.getParameter( "no" );
	    request.setAttribute( "no", no );
	    WebUtil.forward( request, response, "/WEB-INF/views/deleteform.jsp" );
	    
	} else if ( "add".equals( actionName ) ) {
	    String name = request.getParameter( "name" );
	    String password = request.getParameter( "password" );
	    String content = request.getParameter( "content" );

	    GuestbookVO vo = new GuestbookVO();
	    vo.setName( name );
	    vo.setPassword( password );
	    vo.setContent( content );

	    GuestbookDAO dao = new GuestbookDAO();
	    dao.create( vo );

	    WebUtil.redirect( request, response, "/guestbook2/board" );
	    
	} else if ( "delete".equals( actionName ) ) {
	    Long no = Long.parseLong(request.getParameter( "no" ));
		String password = request.getParameter( "password" );
		String content = request.getParameter( "content" );
		
		GuestbookVO vo = new GuestbookVO();
		vo.setNo( no );
		vo.setPassword( password );
		
		GuestbookDAO dao = new GuestbookDAO();
		dao.delete( vo );
		
		WebUtil.redirect( request, response, "/guestbook2/board" );
	} else {
	    /* default action 처리 */
	    GuestbookDAO dao = new GuestbookDAO();
	    List<GuestbookVO> list = dao.readAll();

	    request.setAttribute( "list", list );
	    WebUtil.forward( request, response, "/WEB-INF/views/index.jsp" );
	}
    }

    protected void doPost( HttpServletRequest request, HttpServletResponse response )
	    throws ServletException, IOException {
	doGet( request, response );
    }

}
