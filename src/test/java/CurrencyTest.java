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
        this.currency2_1=new Currency(Currency.CarryType.Two,125,84);
        this.currency2_2=new Currency(Currency.CarryType.Two,481,23);
        this.currency4_1=new Currency(Currency.CarryType.Four,250,19);
        this.currency4_2=new Currency(Currency.CarryType.Four,250,9998);
    }

    @Test
    public void testToString()
    {
        Assert.assertEquals("125.84", currency2_1.toString());
        Assert.assertEquals("481.23", currency2_2.toString());
        Assert.assertEquals("250.0019", currency4_1.toString());
        Assert.assertEquals("250.9998", currency4_2.toString());
    }

    @Test
    public void testAdd()
    {
        Assert.assertEquals("607.07", currency2_1.add(currency2_2).toString());
    }

}
