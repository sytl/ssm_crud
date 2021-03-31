package com.home.crud.service;

import com.home.crud.bean.Department;
import com.home.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentIService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        List<Department> list=departmentMapper.selectByExample(null);
        return list;
    }

}
