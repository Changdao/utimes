import com.utimes.study.fee.*;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
  SchoolFeeStrategyTest is used to test the SchoolFeeStrategy class.
 */
public class SchoolFeeStrategyTest {
    private SchoolFeeStrategy strategy;
    private SchoolFeeType feeType;
    private SchoolFeeDef feeDef;
    private SchoolFeeCalculator calculator;
    private static final String BEFORE_OUT_OF_BROAD="Before out of broad";
    @Before
    public void setUp()
    {
        strategy=new SchoolFeeStrategy();
        strategy.addCategory(new SchoolFeeCategory(BEFORE_OUT_OF_BROAD));
        strategy.addCategory(new SchoolFeeCategory("After out of broad"));
        feeType=new SchoolFeeType();
        feeType.setName("Enrollment Fee");
        feeDef=new SchoolFeeDef(feeType,0,strategy);
        feeDef.setCalculator(new SchoolFeeConstantCalculator(35.0d));
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
        Assert.assertEquals(((SchoolFeeDef)strategy.getCategory(0).get(0)).compute().toDouble(),35.00d,0.0001d);

    }

}
