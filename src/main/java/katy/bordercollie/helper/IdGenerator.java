package katy.bordercollie.helper;

import java.math.BigInteger;

public class IdGenerator {

	public static String generateId() {
		BaseX baseX = new BaseX(BaseX.DICTIONARY_62);
		return baseX.encode(new BigInteger(String.valueOf(System.nanoTime())));
	}
	
	public static void main(String[] args) throws InterruptedException {
		while (true) {
			System.out.println(generateId());
			Thread.sleep(1000);
		}
	}
}
