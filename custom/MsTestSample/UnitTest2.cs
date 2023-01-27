namespace MsTestSample;

public class UnitTest2
{
    [TestClass]
        [TestMethod]
        [TestCategory("tc=23941")]
        [TestCategory("tc:23995")]
        public void SomeOtherTest()
        {
            Console.WriteLine("Testing some other test");
        }
}
