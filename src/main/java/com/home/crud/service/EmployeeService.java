package com.home.crud.service;

import com.home.crud.bean.Employee;
import com.home.crud.bean.EmployeeExample;
import com.home.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper mapper;

    public List<Employee> getAll() {
       return mapper.selectByExampleWithDept(null);

    }

    public void saveEmp(Employee employee) {
        mapper.insertSelective(employee);

    }

//    检查用户名是否可用
    public boolean checkUser(String empName) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count=mapper.countByExample(example);
        return count==0;

    }

    /**
     * 按照员工id查询黁信息
     * @param id
     * @return
     */
    public Employee getEmp(Integer id) {
        Employee employee=mapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        mapper.updateByPrimaryKeySelective(employee);

    }

    public void deleteEmp(Integer id) {
        mapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpIdIn(ids);
        mapper.deleteByExample(example);

    }
}
