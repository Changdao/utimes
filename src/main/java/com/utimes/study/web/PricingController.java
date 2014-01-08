package com.utimes.study.web;

import com.utimes.study.service.PriceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by nevernew on 1/8/14.
 */
@Controller
@RequestMapping("/price")
public class PricingController {

    private PriceService priceService;

    public PriceService getPriceService() {
        return priceService;
    }

    public void setPriceService(PriceService priceService) {
        this.priceService = priceService;
    }

    @RequestMapping(method= RequestMethod.GET)
    public String priceSearch()
    {
        System.out.println("<DEBUG>annotation worked...!");
        return "price";
    }
}
