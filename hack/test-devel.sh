#!/bin/bash

set -e

function test() {
    curl -X POST -d '{"url": "'$1'"}' \
		-H 'Content-Type: application/json' http://127.0.0.1:5000/predict
}

test https://s23705.pcdn.co/wp-content/uploads/2019/12/roadies-2-e1576036605279.jpg
test https://www.insureandgo.com.au/images/1904-header-oresund-bridge-797x557px_tcm1005-547135.jpg
test https://www.aircraftcompare.com/wp-content/uploads/2019/12/airplane-sunset.jpg
test https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Apple_pie.jpg/1200px-Apple_pie.jpg
test https://www.seatrade-maritime.com/sites/seatrade-maritime.com/files/styles/article_featured_retina/public/Container%20ship%20at%20port%20sunrise.jpg
