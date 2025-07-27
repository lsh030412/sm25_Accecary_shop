package edu.sm.shoptemplatetest;

import edu.sm.shoptemplatetest.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j

public class custDelete {

    @Autowired
    CustService custService;

    @Test
	void delete() {
		try {
			custService.remove("user02");
			log.info("Delete End ------------------------------------------");
		} catch (Exception e) {
			log.info("Error Test ...");
			e.printStackTrace();
		}
	}
}
