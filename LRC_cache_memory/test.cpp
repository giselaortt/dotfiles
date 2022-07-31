#include <ostream>
#include <iostream>
#include <unordered_map>
#include <list>
#include <string>
#include <utility>
#include <string>


using namespace std;


int main(){

    list<int> test;
    list<int>::iterator it;
    it = test.end(); it--;
  

//    unordered_map < int, list<int>::iterator > hash;
    unordered_map<int, pair<string, list<int>::iterator >>  hash;

    
//    for( int i=0; i<10; i++ ) test.push_back( i*4 );


    test.push_back( 2 );
    it = test.end(); it--;
    pair<string, list<int>::iterator  > testpair =  make_pair( "bla", it );
    hash[ 2 ] = testpair;
    it =hash[2].second;
    hash.erase(2);
    test.erase( it );


    for( int i=0; i<10; i++ ){
        test.push_back( i*4 );
        it = test.end(); it--;
        pair<string, list<int>::iterator  > testpair =  make_pair( "bla", it );
        hash[ i*4 ] = testpair;
    }


    for( int i=0; i<10; i++ ){
        it = hash[ i*4 ].second;
//        hash.erase( i*4 );
        test.erase(it);
        hash.erase(i*4);
    }

    
    for( int i=0; i<10; i++ ){
        cout << hash[i*4].first;
    }


return 0;
}
