
import com.home.crud.bean.Employee;
import com.home.crud.dao.DepartmentMapper;
import com.home.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 使用spring 的单元测试可以自动注入我们需要的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    /**
     * 测试DepartmentMapper
     */
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCRUD(){

        System.out.println(departmentMapper);

//        //插入部门
//        departmentMapper.insert(new Department(null,"开发部"));
//        departmentMapper.insert(new Department(null,"设计部"));
//
//        //插入员工
//        employeeMapper.insert(new Employee(null,"tom","M","123@home.com",1));
//        employeeMapper.insert(new Employee(null,"jerry","M","456@home.com",2));

//        批量插入员工，可以使用执行批量操作的sqlsession
        EmployeeMapper mapper= sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<1000;i++){
            String uid= UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@home.com",2));
        }
        System.out.println("批量插入成功");
    }
}
