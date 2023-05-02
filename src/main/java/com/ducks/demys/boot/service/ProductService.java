package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.ProductRepository;
import com.ducks.demys.boot.vo.Product;

@Service
public class ProductService {
	
	private ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository= productRepository;
	}
	
	public List<Product> getProductListByPJ_NUM(int PJ_NUM){
		return productRepository.getProductListByPJ_NUM(PJ_NUM);
	}

	public Product getProductByProduct_NUM(int PRODUCT_NUM){
		return productRepository.getProductByPRODUCT_NUM(PRODUCT_NUM);
	}
	
	public void registProduct(Product Product) {
		Product.setPRODUCT_NUM(productRepository.selectProductSequenceNextValue());
		productRepository.registProduct(Product);
	}
	
	public void modifyProduct(Product Product) {
		productRepository.modifyProduct(Product);
	}
	
	public void removeProduct(int PRODUCT_NUM) {
		productRepository.removeProduct(PRODUCT_NUM);
	}
}
