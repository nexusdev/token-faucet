// Basic faucet for a single token with a fixed address.
// Dispenses a fixed percentage of the total supply for each `claim` call.
import 'erc20/erc20.sol';

contract TokenFaucet {
    ERC20 _token;
    uint _claim_proportion;
    function TokenFaucet( ERC20 token, uint claim_proportion )
    {
        _token = token;
        _claim_proportion = claim_proportion;
    }
    function claim() returns (uint amount_claimed) {
        var remaining_balance = _token.balanceOf(this);
        var claimed = remaining_balance / _claim_proportion;
        var ok = _token.transfer(msg.sender, claimed);
        if( !ok ) {
            throw;
        }
        return claimed;
    }
    function() {
        throw;
    }
}
