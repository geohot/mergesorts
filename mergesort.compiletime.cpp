template<int... Seq>
struct Sequence{};


template<bool Condition, typename IfTrue, typename IfFalse>
struct If {};
template<typename IfTrue, typename IfFalse>
struct If<true, IfTrue, IfFalse> {
    using value = IfTrue;
};
template<typename IfTrue, typename IfFalse>
struct If<false, IfTrue, IfFalse> {
    using value = IfFalse;
};


template<typename TFirst, typename TSecond>
struct ConcatSequence {};

template<int... First, int... Second>
struct ConcatSequence < Sequence<First...>, Sequence<Second...>>{
    using value = Sequence<First..., Second...>;
};


template<typename TSequence, int Begin, int End>
struct Slice {
    using value = Sequence<>;
};
template<int Begin, int End, int Head, int... Tail>
struct Slice<Sequence<Head, Tail...>, Begin, End> {
    using value = typename If<(End<=0),
        Sequence<>,
        typename If<(Begin > 0),
            typename Slice<Sequence<Tail...>, Begin-1, End - 1>::value,
            typename ConcatSequence<Sequence<Head>, typename Slice<Sequence < Tail...>, 0, End - 1>::value>::value
        >::value
    >::value;
};







template<typename ASeq, typename BSeq>
struct Merge {};

template<>
struct Merge<Sequence<>, Sequence<>> {
    using value = Sequence<>;
};

template<int... Left>
struct Merge<Sequence<Left...>, Sequence<>> {
    using value = Sequence<Left...>;
};
template<int... Right>
struct Merge<Sequence<>, Sequence<Right...>> {
    using value = Sequence<Right...>;
};

template<int AHead, int BHead, int... ATail, int...BTail>
struct Merge<Sequence<AHead, ATail...>, Sequence<BHead, BTail...>> {
    using value = typename If<(AHead < BHead),
        typename ConcatSequence<Sequence<AHead>, typename Merge<Sequence<ATail...>, Sequence<BHead, BTail...>>::value>::value,
        typename ConcatSequence<Sequence<BHead>, typename Merge<Sequence<AHead, ATail...>, Sequence<BTail...>>::value>::value
    >::value;
};


template<typename TSeq>
struct MergeSort{
    using value = Sequence<>;
};

template<int Elem>
struct MergeSort<Sequence<Elem>> {
    using value = Sequence<Elem>;
};

template<int... Seq>
class MergeSort<Sequence<Seq...>> {
    static constexpr int END = sizeof...(Seq), MID = END / 2;
public:
    using value = typename Merge<
        typename MergeSort<typename Slice<Sequence<Seq...>, 0, MID>::value>::value,
        typename MergeSort<typename Slice<Sequence<Seq...>, MID, END>::value>::value
    >::value;
};


int main()
{
    using Sorted = typename MergeSort<Sequence<5, 9, 1, 3, 4, 6, 6, 3, 2>>::value;
    Sorted::fail;
}
