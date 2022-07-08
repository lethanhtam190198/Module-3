package controller;

import model.BenhAn;
import service.impl.BenhAnService;
import service.IService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/benhan")
public class BenhAnServlet extends HttpServlet {

    static List<BenhAn> benhAnList = new ArrayList<>();
    private IService benhAnService = new BenhAnService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("view/create.jsp").forward(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }




    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        benhAnList = benhAnService.findAll();
        request.setAttribute("benhAnList", benhAnList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {

        benhAnList = benhAnService.findAll();

        String mabenhan = request.getParameter("mabenhan");
        int idbenhnhan = Integer.parseInt(request.getParameter("idbenhnhan"));
        String tenbenhnhan = request.getParameter("tenbenhnhan");
        String ngaynhapvien = request.getParameter("ngaynhapvien");
        String ngayravien = request.getParameter("ngayravien");

        BenhAn benhAn = new BenhAn(mabenhan, idbenhnhan, tenbenhnhan, ngaynhapvien, ngayravien);
        benhAnService.create(benhAn);
        response.sendRedirect("/benhan");
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        BenhAn benhAn = this.benhAnService.findById(id);

        RequestDispatcher dispatcher;

        request.setAttribute("benhAn", benhAn);
        dispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        String mabenhan = request.getParameter("mabenhan");
        int idbenhnhan = Integer.parseInt(request.getParameter("idbenhnhan"));
        String tenbenhnhan = request.getParameter("tenbenhnhan");
        String ngaynhapvien = request.getParameter("ngayvaovien");
        String ngayravien = request.getParameter("ngayravien");

        BenhAn benhAn = new BenhAn(id, mabenhan, idbenhnhan, tenbenhnhan, ngaynhapvien, ngayravien);
        benhAnService.edit(benhAn);

        try {
            response.sendRedirect("/benhan");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        BenhAn benhAn = this.benhAnService.findById(id);
        RequestDispatcher dispatcher;
        this.benhAnService.delete(id);
        try {
            response.sendRedirect("/benhan");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
