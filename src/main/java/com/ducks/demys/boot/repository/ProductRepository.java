package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Product;

@Mapper
public interface ProductRepository {

	public List<Product> getProductListByPJ_NUM(int PJ_NUM);
	
	public Product getProductByPRODUCT_NUM(int PRODUCT_NUM);
	
	public int selectProductSequenceNextValue();
	
	public void registProduct(Product product);
	
	public void modifyProduct(Product product);
	
	public void removeProduct(int PRODUCT_NUM);
	
}