import RbTree "mo:base/RBTree";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";

actor {
    let tree = RbTree.RBTree<Principal, Text>(Principal.compare);

    public query func getMyTree(): async [(Principal, Text)]{
        Iter.toArray(tree.entries());
    };

    public shared ({caller}) func register(name: Text): async Text {
        let user = tree.get(caller);
        switch user {
            case (?user){ return "User already registered: -----> " # user};
            case null {
                tree.put(caller, name);
                return "Register success"
            };
        };
    };

};
