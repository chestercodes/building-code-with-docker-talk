module app2.Tests

open NUnit.Framework

[<Test>]
let ``Test that shows why I ❤️ F#`` () =
    let expected = 1
    let result = 2
    Assert.AreEqual(expected, result)
