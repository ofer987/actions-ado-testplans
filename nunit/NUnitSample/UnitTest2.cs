using System;
using NUnit.Framework;

namespace NUnitTestProject
{
    [TestFixture]
    public class UnitTest2
    {
        [Test]
        [Category("tc:24074")]
        public void SomeOtherTest()
        {
            Console.WriteLine("Testing some other test");
        }
    }
}
