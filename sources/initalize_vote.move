module fairvote::initalize_vote {
    use std::string;


    public struct Voting_Session has key, store{
        id: UID,
        title: string::String,
        options: vector<string::String>,
        vote_counts: vector<u64>,
        voters_address: vector<address>,
        voters_name: vector<string::String>,
        deadline: u64,
    }


    public fun initialize_voting_session(
        ctx: &mut TxContext,
        options: vector<string::String>,
        deadline: u64,
    ){
        if (vector::length(&options) == 0) {
            abort(0)
        };

        let now = tx_context::epoch_timestamp_ms(ctx);
        if (deadline > now){
            abort(0)
        };

        let mut vote_counts = std::vector::empty<u64>();
        let mut index = 0;
        let length = std::vector::length(&options);
        while (index < length){
            std::vector::push_back(&mut vote_counts, 0);
            index = index + 1
        }

        let voting_session = Voting_Session{
            id: objects::new(ctx),
            options,
            vote_counts,
            voters_address,
            voters_name,
            deadline,
        };
    }
}
