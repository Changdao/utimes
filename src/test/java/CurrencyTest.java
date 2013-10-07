import com.utimes.study.bean.Currency;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-27
 * Time: 上午12:30
 * To change this template use File | Settings | File Templates.
 */
public class CurrencyTest{

    private Currency currency2_1;
    private Currency currency2_2;
    private Currency currency4_1;
    private Currency currency4_2;

    @Before
    public void setUp() throws Exception
    {
        //System.out.println("Test SetUp");
        this.currency2_1=new Currency(Currency.CarryType.Two,125,84);
        this.currency2_2=new Currency(Currency.CarryType.Two,481,23);
        this.currency4_1=new Currency(Currency.CarryType.Four,250,19);
        this.currency4_2=new Currency(Currency.CarryType.Four,250,9998);
    }

    @Test
    public void testToString()
    {
        //System.out.println("Test ToString");
        Assert.assertEquals("125.84", currency2_1.toString());
        Assert.assertEquals("481.23", currency2_2.toString());
        Assert.assertEquals("250.0019", currency4_1.toString());
        Assert.assertEquals("250.9998", currency4_2.toString());
    }

    @Test
    public void testAdd()
    {
        //System.out.println("Test Add");
        Assert.assertEquals("607.07", currency2_1.add(currency2_2).toString());
    }


    @Test
    public void testInit()
    {
        //System.out.println("Test init with double");
        Currency currency=new Currency(Currency.CarryType.Two,32.23);
        Assert.assertEquals(32l,currency.getWhole());
        Assert.assertEquals(23l,currency.getDecimal());
    }

    @Test
    public void testInit2()
    {
        //System.out.println("Test init with double");
        Currency currency=new Currency(Currency.CarryType.Two,0.0);
        Assert.assertEquals(0,currency.getWhole());
        Assert.assertEquals(0,currency.getDecimal());

        currency=new Currency(Currency.CarryType.Two,555.0);
        Assert.assertEquals(555,currency.getWhole());
        Assert.assertEquals(0,currency.getDecimal());
    }


}
