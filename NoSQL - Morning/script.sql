-- 2
SELECT airlineid,
       SUM(distance) AS distanceSum
       FROM `travel-sample`
WHERE type="route"
GROUP BY airlineid;

-- 3
-- INNER JOIN:
SELECT *
FROM `travel-sample` r
    JOIN `travel-sample` a ON r.airlineid = META(a).id
WHERE r.sourceairport = "SFO"
LIMIT 100

-- LEFT JOIN:
SELECT *
FROM `travel-sample` r
LEFT JOIN `travel-sample` a
ON r.airlineid = META(a).id
WHERE r.sourceairport = "SFO" 
LIMIT 100

-- RIGHT JOIN:
SELECT *
FROM `travel-sample` r
RIGHT JOIN `travel-sample` a
ON r.airlineid = META(a).id
WHERE r.sourceairport = "SFO" 
LIMIT 100

-- 4
-- map
function (doc, meta) {
  if(doc.type == "router")
  	emit(meta.id, null);
}

-- reduce
_count

-- export
cbexport json -c couchbase://127.0.0.1 -u &lt;USER NAME&gt; -p &lt;password&gt;
-b travel-sample -o C:/travelSample.json -f lines -t 4

-- import
cbimport json -c couchbase://127.0.0.1 -u &lt;User Name&gt; -p &lt;password&gt; -b
NewBucket -f lines -d file://C:/travelSample.json -t 4 -g %id%

