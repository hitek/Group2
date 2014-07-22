package process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.ArticleDAO;
import beans.Article;


@WebServlet("/ProcessForm")
public class ProcessForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String text = request.getParameter("text");
		
		out.println("<p>Processed Form as GET</p>");
		out.println("Title: " + title);
		out.println("<br/>Name: " + author);
		out.println("<br/>Text: " + text);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String text = request.getParameter("text");
		
		Article article = new Article();
		article.setArticleTitle(title);
		article.setArticleAuthor(author);
		article.setArticleText(text);
		
		int status = ArticleDAO.addArticle(article);
		
		response.sendRedirect("Index.jsp");
		
	}

}