export AWS_ACCESS_KEY_ID="ASIA3RFXFS3BMF7AMREH"
export AWS_SECRET_ACCESS_KEY="rPo/UwY6NNDe8MpfolTcX9RCEiq74RyJ7CCiY2lT"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjENb//////////wEaDmFwLXNvdXRoZWFzdC0xIkYwRAIgFqyHs61g1M/EecMfg5zLh3lTRiCtUwj4Xa1QGJYNO9sCICc0/2nhJfhyNLdYv3dyrgns7Q6+08rv+/OA9+ozZwc5Kq4DCG8QABoMNzkyODA1NjExMjAyIgyHPhqU7upDBc4LDSUqiwNN0PCrdklbNnI2v5bRqPBHZM9anZ7hKtvCoPGXN8dv4FAfPVOgk0L9fLylszoVtBriG86E4qL9blIWPVsGiNO8I+WhNLrQIVCTFGTtCsmgk3WJZMxEMiHdybIBuQ/63TR32kNMbsJEGfmbt0WPDQkE1hNAbCIvY1JIjBjeCcakjJj2bCwzw6XuSBOXtwaOZOgqVGJR5fuLUgmZropA3fl1oR2iVcdtiwsmbn+ISDSAN9yUubuXBcw624KEj1tfm1bBAO24x/uOAqDgoUHF915X9iip36t/xhyKWTRYIDa+QAJEJcOrVOHyi0wVYKD7rg7Vcl0ZkLvEyf37Tju+3uDjxm7WWxzXtFmAR4piO0nmaLJZoVRbpmbBmc+rigakWbki5taZGIF/dF3EnuHidQP1w4oKo3208ESUBeydfPFp9YIVfv8hgcWRp12QEUlPkVy9Qmo7gx2GD5+152sB7T47bBAqJ4bFSkeueAzJ7iOdAiGS8wV11FCkVxXQMfdbCYYMOME2wVT3lJEE8DCYhtmsBjqnAZQeFHyBM56rxvP4L8HB7ZEnT/88Q35nn4LSh93sG+cqCUz8taM7mjs4Ecd/Ov/J/6uTmjU7V1zluYPrCRNm1Iex6FiWQY4c+Qqb8BJnlWcXT9Dvuh0DgNHRkzOq6NzrdRspdB3VFqLJlALyGUB9iaKKd8kKklF5u3WEjmA5wN6WIhC+o1gDq1cwFP0gnIiNgiXZVXNpaztl2DvFSWYm0VSl6fMeyg9m"

## 1. GET WORKSPACE ID
TOKEN='yFfUjYLtKv530Q.atlasv1.y8V5mCYkS7Wusiju2rpywyyjZsX6kztesEGL75PpOyAonWoez9zZG3S36j9ghze1mF4'
WORKSPACE_NAME='test'
ORG_NAME='insureMo'
WORKSPACE_ID=($(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/organizations/$ORG_NAME/workspaces/$WORKSPACE_NAME \
  | jq -r '.data.id'))
echo $WORKSPACE_ID

## 2.Set AK/SK and Session Token
export VARIABLE_2_KEY="AWS_ACCESS_KEY_ID"
cat <<EOF > payload.json
{
  "data": {
    "type":"vars",
    "attributes": {
      "key":"${VARIABLE_2_KEY}",
      "value":"${AWS_ACCESS_KEY_ID}",
      "category":"env",
      "hcl":false,
      "sensitive":true
    }
  }
}
EOF
curl -s \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @payload.json \
  https://app.terraform.io/api/v2/workspaces/${WORKSPACE_ID}/vars | jq -r .


export VARIABLE_3_KEY="AWS_SECRET_ACCESS_KEY"
cat <<EOF > payload.json
{
  "data": {
    "type":"vars",
    "attributes": {
      "key":"${VARIABLE_3_KEY}",
      "value":"${AWS_SECRET_ACCESS_KEY}",
      "category":"env",
      "hcl":false,
      "sensitive":true
    }
  }
}
EOF
curl -s \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @payload.json \
  https://app.terraform.io/api/v2/workspaces/${WORKSPACE_ID}/vars | jq -r .

export VARIABLE_4_KEY="AWS_SESSION_TOKEN"
cat <<EOF > payload.json
{
  "data": {
    "type":"vars",
    "attributes": {
      "key":"${VARIABLE_4_KEY}",
      "value":"${AWS_SESSION_TOKEN}",
      "category":"env",
      "hcl":false,
      "sensitive":true
    }
  }
}
EOF

curl -s \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @payload.json \
  https://app.terraform.io/api/v2/workspaces/${WORKSPACE_ID}/vars | jq -r .
