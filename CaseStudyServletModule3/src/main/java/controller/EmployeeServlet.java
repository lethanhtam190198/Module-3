package controller;

import dto.Divison;
import dto.EducationDegree;
import dto.Position;
import model.Customer;
import model.Employee;
import service.*;
import service.impl.DivisionService;
import service.impl.EducationDegreeService;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {

    static List<Employee> employeeList = new ArrayList<>();
    private IEmployeeService employeeService = new EmployeeService();

    //    static List<Divison> divisionList= new ArrayList<>();
    private IDivisionService divisionService = new DivisionService();

    //    static List<EducationDegree> educationDegreeList = new ArrayList<>();
    private IEducationDegreService educationDegreService = new EducationDegreeService();

    //    static List<Position> positionList = new ArrayList<>();
    private IPositionService positionService = new PositionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
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
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }


    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        List<Divison> divisionList = divisionService.findAll();
        request.setAttribute("divisionList", divisionList);
        List<EducationDegree> educationDegreeList = educationDegreService.findAll();
        request.setAttribute("educationDegreeList", educationDegreeList);
        List<Position> positionList = positionService.findAll();
        request.setAttribute("positionList", positionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        employeeList = employeeService.findAll();
        int max = 0;
        for (Employee item : employeeList) {
            if (item.getEmployeeId() > max) {
                max = item.getEmployeeId();
            }
        }
        int id = max + 1;
        String employeeName = request.getParameter("name");
        String employeeBirthDay = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("idcard");
        double employeeSalary = Double.parseDouble(request.getParameter("salary"));
        int employeePhone = Integer.parseInt(request.getParameter("phone"));
        String employeeEmail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        int employeePositionId = Integer.parseInt(request.getParameter("position"));
        int employeeEducationDegreeId = Integer.parseInt(request.getParameter("education_degree"));
        int employeeDivisionId = Integer.parseInt(request.getParameter("division"));
        String employeeUserName = request.getParameter("username");

        Employee employee = new Employee(id, employeeName, employeeBirthDay,
                employeeIdCard, employeeSalary, employeePhone, employeeEmail,
                employeeAddress, employeePositionId, employeeEducationDegreeId,
                employeeDivisionId, employeeUserName);
        employeeService.create(employee);
        response.sendRedirect("/employee");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.employeeService.findById(id);
        List<Divison> divisionList = divisionService.findAll();
        request.setAttribute("divisionList", divisionList);
        List<EducationDegree> educationDegreeList = educationDegreService.findAll();
        request.setAttribute("educationDegreeList", educationDegreeList);
        List<Position> positionList = positionService.findAll();
        request.setAttribute("positionList", positionList);

        RequestDispatcher dispatcher;
        request.setAttribute("employee", employee);
        dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String employeeName = request.getParameter("name");
        String employeeBirthDay = request.getParameter("birthday");
        String employeeIdCard = request.getParameter("idcard");
        double employeeSalary = Double.parseDouble(request.getParameter("salary"));
        int employeePhone = Integer.parseInt(request.getParameter("phone"));
        String employeeEmail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        int employeePositionId = Integer.parseInt(request.getParameter("position"));
        int employeeEducationDegreeId = Integer.parseInt(request.getParameter("education"));
        int employeeDivisionId = Integer.parseInt(request.getParameter("division"));
        String employeeUserName = request.getParameter("username");

        Employee employee = new Employee(id, employeeName, employeeBirthDay, employeeIdCard, employeeSalary, employeePhone,
                employeeEmail, employeeAddress, employeePositionId, employeeEducationDegreeId, employeeDivisionId, employeeUserName);

        employeeService.edit(employee);

        try {
            request.getRequestDispatcher("view/employee/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.employeeService.findById(id);
        RequestDispatcher dispatcher;
        this.employeeService.delete(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //findAll(request,response);

    }
}
