import org.junit.*;
import static org.junit.Assert.*;

import org.approvaltests.Approvals;
import org.approvaltests.reporters.UseReporter;
import org.approvaltests.reporters.JunitReporter;

@UseReporter(JunitReporter.class)
public class HikerTest {

    @Test
    public void hhgttg() throws Exception {
        int actual = Hiker.answer();
        Approvals.verify("" + actual);
    }
}
