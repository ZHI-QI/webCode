package com.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import com.itheima.bean.Category;
import com.itheima.bean.Order;
import com.itheima.bean.Product;
import com.itheima.bean.User;

public interface InDao {

	/**
	 * 激活码对比方法，Dao接口方法
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	User Iodao(String code) throws SQLException;
	/**
	 * 激活状态修改方法，Dao接口方法
	 * 
	 */
    void IoModifier(String code) throws SQLException;    
    
    /**
	 * 分类信息dao接口
	 * @author Administrator
	 *
	 */
	List<Category> dao_findAll () throws SQLException;
	

	/**
	 * 登录dao接口
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	User daoRegister(String username, String password) throws Exception;

	/**
	 * 激活dao接口
	 * @param activateid
	 * @return
	 * @throws SQLException
	 */
	User daoactivate(String activateid) throws SQLException ;
	/**
	 * 注册方法，Dao接口方法
	 * @param user
	 * @throws SQLException
	 * @throws Exception
	 */
	void Iodao(User user) throws Exception;
	
	/**
	 * 展示全部商品
	 * @return
	 * @throws Exception
	 */
	List<Product> hotList() throws Exception;
	/**
	 * 后台-添加商品分类
	 * @param cname
	 * @param id
	 * @throws SQLException 
	 */
	void dao_addUI(String cname, String id) throws SQLException;
	/**
	 * 后台-删除商品分类
	 * @param cid
	 * @throws SQLException
	 */
	void dao_deleteaddUI(String cid)throws SQLException;
	/**
	 * 添加所有商品
	 * @param product
	 * @throws SQLException 
	 */
	void dao_addProductServlet(Product product) throws SQLException;
	/**
	 * 查询全部订单总数量
	 * @param state 
	 * @return
	 */
	int State_sumPage(int state)throws SQLException;
	/**
	 * 后台-查询每页显示多少订单
	 * @param a
	 * @param b
	 * @return
	 * @throws SQLException 
	 */
	List<Order> State_sum02(int state,int a, int b) throws SQLException;
	/**
	 * 后台-遍历所有点单
	 * @param a
	 * @param b
	 * @return
	 * @throws SQLException 
	 */
	List<Order> State_sum01(int a, int b) throws SQLException;
	
	


	
	
	
}
