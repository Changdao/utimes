import com.utimes.study.fee.*;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;

/**
  SchoolFeeStrategyTest is used to test the SchoolFeeStrategy class.
 */
public class SchoolFeeStrategyTest {
    private SchoolFeeStrategy strategy;
    private SchoolFeeType feeType;
    private SchoolFeeType feeType2;
    private SchoolFeeDef feeDef;
    private SchoolFeeDef feeDef2;
    private SchoolFeeDef feeDef3;
    private SchoolFeeCalculator tableCalculator;
    private SchoolFeeCalculator calculator;
    private static final String BEFORE_OUT_OF_BROAD="Before out of broad";
    @Before
    public void setUp()
    {
        strategy=new SchoolFeeStrategy();
        strategy.addCategory(new SchoolFeeCategory(BEFORE_OUT_OF_BROAD));
        strategy.addCategory(new SchoolFeeCategory("After out of broad"));

        feeType=new SchoolFeeType("Enrollment Fee");
        feeType2=new SchoolFeeType("Junior English Course");

        feeDef=new SchoolFeeDef(feeType,strategy);
        feeDef.setCalculator(new SchoolFeeConstantCalculator(35.0d));



        HashMap<String,Double> rateMap=new HashMap<String,Double>();

        //To Fella: =IF(E15="ESL-4 Course";700;
        // IF(E15="ESL-6 Course";800;
        // IF(E15="ESL+TOEIC Course";750;
        // IF(E15="PPI Course";750;
        // IF(E15="PPT Course";750;
        // IF(E15="PIFT Course";800;
        // IF(E15="PTFT Course";800;
        // IF(E15="AEFT Course";750;
        // IF(E15="Executive Business Course";750;
        // IF(E15="Junior English Course";850;
        // IF(E15="Guardian English Course";550;
        // IF(E15="Power Intensive Course-4";750;
        // IF(E15="Power Intensive Course-5";800;900)
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        // )
        rateMap.put("1",300.00d);
        rateMap.put("2",550.00d);
        rateMap.put("3",750.00d);
        rateMap.put("4",800.00d);
        rateMap.put("8",1600.00d);
        rateMap.put("16",2400.00d);

        tableCalculator= new SchoolFeeTableCalculator(rateMap,4,200);
        feeDef2=new SchoolFeeDef(feeType2,strategy);
        feeDef2.setCalculator(tableCalculator);


        SchoolFeeType feeType3=new SchoolFeeType("Course");

        feeDef3=new SchoolFeeDef(feeType3,strategy);
        SchoolFeeCalculator multiplexCalculator=new SchoolFeeMultiplexCalculator(750,4);
        feeDef3.setCalculator(multiplexCalculator);

    }

    @Test
    public void testFeeStrategy()
    {
        Assert.assertEquals(strategy.getCategory(0).getName(), BEFORE_OUT_OF_BROAD);
    }

    @Test
    public void testFeeDef()
    {

        strategy.getCategory(0).add(feeDef);
        Assert.assertEquals(feeDef.compute(35.00d).toDouble(),35.00d,0.0001d);

    }

    @Test
    public void testFeeCalc()
    {
        Assert.assertEquals(feeDef2.compute(9).toDouble(),1800.00d,0.001d);
        Assert.assertEquals(feeDef3.compute(1).toDouble(),188d,0.001d);
        Assert.assertEquals(feeDef3.compute(2).toDouble(),375d,0.001d);
        Assert.assertEquals(feeDef3.compute(3).toDouble(),563d,0.001d);
        Assert.assertEquals(feeDef3.compute(4).toDouble(),750d,0.001d);
        Assert.assertEquals(feeDef3.compute(5).toDouble(),938d,0.001d);

    }


}
