<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/common/session.jsp"%>
<%
	String actArg[] = { "register", "ActWine", "ActPaper", "ActEncap",
			"ActBottle", "CheckOut", "AdminDel" };
	try {
		String taction = request.getParameter("action");
		if (taction.equals(actArg[0])) {
			String un = request.getParameter("usrname");
			String up = request.getParameter("usrpass");
			String uc = request.getParameter("cfrpass");
			String ue = request.getParameter("usremail");
			if (up.equals(uc)) {
				Usr = Usr.usrReg(un, up, ue);
				response.sendRedirect("/WineGuy/do.jsp");
			} else
				response.sendRedirect("/WineGuy/register.jsp");
		}
		//ActWine
		if (taction.equals(actArg[1])) {
			int wt = 0;
			int wi = Integer.parseInt(request.getParameter("wtype"));
			switch (wi) {
			case 1:
				wt = 1;
				break;
			case 2:
				wt = 2;
				break;
			case 3:
				wt = 3;
				break;
			case 4:
				wt = 4;
			case 5:
				wt = 4;
				break;
			}
		}
		//ActPaper
		if (taction.equals(actArg[2])) {
			int pt = 0;
			int pi = Integer.parseInt(request.getParameter("ptype"));
			switch (pi) {
			case 1:
				pt = 1;
				break;
			case 2:
				pt = 2;
				break;
			case 3:
				pt = 3;
				break;
			case 4:
				pt = 4;
				break;
			}
		}
		//ActEncap
		if (taction.equals(actArg[3])) {
			int et = 0;
			int ei = Integer.parseInt(request.getParameter("etype"));
			//int ecolor=Integer.parseInt(request.getParameter("ecolor"));
			switch (ei) {
			case 1:
				et = 1;
				break;
			case 2:
				et = 2;
				break;
			case 3:
				et = 3;
				break;
			case 4:
				et = 4;
				break;
			}
			//et=et*10+ecolor;
		}
		//ActBottle
		if (taction.equals(actArg[4])) {
			int bt = 0;
			int bi = Integer.parseInt(request.getParameter("btype"));
			switch (bi) {
			case 1:
				bt = 1;
				break;
			case 2:
				bt = 2;
				break;
			case 3:
				bt = 3;
				break;
			case 4:
				bt = 4;
				break;
			}
		}
		//checkout
		if (taction.equals(actArg[5])) {
		}
		//Admin
		if (taction.equals(actArg[6])) {
			try {
				String items[] = request.getParameterValues("item");
				for (int i = 0; i < items.length; i++) {
				}
				response.sendRedirect("/WineGuy/actions/admin.jsp");
			} catch (Exception e) {
				response.sendRedirect("/WineGuy/actions/admin.jsp");
			}
		}
		//End of Acts
	} catch (Exception ex) {
		if (Usr.getAuth())
			response.sendRedirect("/WineGuy/actions/MySubmission.jsp");
		else
			response.sendRedirect("/WineGuy/index.html");

	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

