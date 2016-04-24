import 'dapple/test.sol';
import 'erc20/base.sol';
import 'faucet.sol';

contract TokenFaucetTest is Test {
    TokenFaucet faucet;
    ERC20Base token;
    function setUp() {
        token = new ERC20Base(10**20);
        faucet = new TokenFaucet(token, 10**6);
    }
    function testFaucet() {
        assertEq( faucet.claim(), 0 );
        token.transfer(faucet, 10**6);
        assertEq(faucet.claim(), 1);
        token.transfer(faucet, (10**12) - (10**6) + 1);
        assertEq(faucet.claim(), (10**12)/(10**6));
    }
}
