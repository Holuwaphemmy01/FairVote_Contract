module fairvote::initalize_vote {
    use std::string;


    public struct Voting_Session has key, store{
        id: UID,
        title: string::String,
        options: vector<string::String>,
        vote_counts: vector<u64>,
        voters_address: vector<address>,
        voters_name: vector<string::String>,
    }


    public fun initialize_voting_session(
        ctx: &mut TxContext,
        options: vector<string::String>,
        deadline: u64,
    ){
        assert!(std::vector::length(&options) > 0, error::invalid_argument(0));

    }
}
