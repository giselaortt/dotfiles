#include <ostream>
#include <iostream>
#include <unordered_map>
#include <list>
#include <string>
#include <utility>

using namespace std;


class LRU{
    private:
    unordered_map<int, pair< list<int>::iterator, string > > hash;
    list<int> orderOfUse;
    const int max = 9;

    public:
    void put( int key, string value ){
        orderOfUse.push_back( key );
        list<int>::iterator lastElement = orderOfUse.end(); lastElement--;
        hash[key] = make_pair( lastElement, value ) ;

        if( hash.size() <= max )
            return;

        int keyToRemove = orderOfUse.front();
        orderOfUse.pop_front();
        hash.erase( keyToRemove );
    }

    string get( int key ){
        if(  !hash.count( key ) )
            return "does not contain";
        string value = hash[ key ].second;
        list<int>::iterator node = hash[key].first;
        orderOfUse.erase( node );
        orderOfUse.push_back( key );
        list<int>::iterator it = orderOfUse.end(); it--;
        hash[ key ].first = it;

        return value;
    }

    void remove( int key ){
        if( !hash.count(key) )
            return;
        list<int>::iterator node = hash[key].first;
        hash.erase( key );
        orderOfUse.erase( node );
    }


};


int main(){

    LRU lru = LRU();
    for( int i=0; i<10; i++ ){
        lru.put( i*2, "bla" );
    }

    for( int i=0; i<10; i++ ){
        cout << lru.get( i*2 ) << endl;
    }

    for( int i=0; i<10; i++ ){
        lru.remove( i*2 );
    }

return 0;

}

