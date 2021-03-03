package com.kh.ehshe.shop.model.Exception;

public class UpdateShopAttachmentFailException extends RuntimeException {

	
	// 이를 상속받은 자식은 모두 unchecked Exception이 된다.
	public UpdateShopAttachmentFailException() {
		super();
	}
	public UpdateShopAttachmentFailException(String message) {
		super(message);
	}
	
}
