import org.junit.jupiter.api.*;

import org.approvaltests.Approvals;
import org.approvaltests.reporters.UseReporter;
import org.approvaltests.reporters.JunitReporter;

@UseReporter(JunitReporter.class)
class HikerTest {

    @Test
    void hhgttg() throws Exception {
        int actual = Hiker.answer();
        Approvals.verify("" + actual);
    }
}
