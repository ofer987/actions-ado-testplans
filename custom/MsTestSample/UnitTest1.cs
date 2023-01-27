namespace MsTestSample
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        [TestCategory("MyCategory")]
        [TestCategory("tc=23938")]
        [TestCategory("story:17372")]
        [TestCategory("tc:23992")]
        public void OnePassingTest()
        {
            // perform test
        }

        [TestMethod]
        [TestCategory("tc=23939")]
        [TestCategory("tc:23993")]
        public void OneFailingTest()
        {
            Console.WriteLine("This is a passing test");
            Assert.Fail("This is a simulated error");
        }

        [DataTestMethod]
        [TestCategory("tc=23940")]
        [DataRow("foo", 1, DisplayName = "First")]
        [DataRow("bar", 2, DisplayName = "Second")]
        [DataRow("baz", 3, DisplayName = "Third")]
        [TestCategory("tc:23994")]
        public void SampleDataDriven(string a, int b)
        {
            Console.WriteLine($"Testing: {a}, {b}");
        }
    }
}