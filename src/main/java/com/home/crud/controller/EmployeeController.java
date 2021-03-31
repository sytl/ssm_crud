package com.home.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.home.crud.bean.Employee;
import com.home.crud.bean.Msg;
import com.home.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD请求
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * 删除员工,批量单个删除二合一
     * 批量删除1-2-3
     * 单个删除1
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] str_ids=ids.split("-");
            for(String string:str_ids){
                del_ids.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(del_ids);

        }else {
            Integer id=Integer.parseInt(ids);
            employeeService.deleteEmp(id);

        }
        return Msg.success();
    }

    /**
     * 更新员工
     */
    @ResponseBody
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emps/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee=employeeService.getEmp(id);
        return Msg.success().add("emp",employee);


    }

    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(@RequestParam("empName")String empName){
//        先判断用户名是否是合法的表达式
        String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位的英文和数字的组合或者2-5位中文");
        }
//        数据库用户名重复校验
       boolean b= employeeService.checkUser(empName);
       if(b){
          return Msg.success();
       }else {
          return Msg.fail().add("va_msg","用户名不可用");
       }
    }


    /**
     * 导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,10);
        List<Employee> emps=employeeService.getAll();
        //封装了详细的分页信息，包括有我们查出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(emps,10);
        return Msg.success().add("pageInfo",page);
    }

    /**
     * JSR303校验
     * @param employee
     * @param result
     * @return
     */
    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
//            校验失败应该返回失败信息到模态框
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors=result.getFieldErrors();
            for(FieldError fieldError:errors){
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

}

//@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        PageHelper.startPage(pn,10);
//        List<Employee> emps=employeeService.getAll();
//        //封装了详细的分页信息，包括有我们查出来的数据，传入连续显示的页数
//        PageInfo page=new PageInfo(emps,10);
//        model.addAttribute("pageInfo",page);
//        return "list";
//
//    }
