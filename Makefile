createdb:
	createdb --username=postgres --owner=postgres go-finance

postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:14-alpine

migrationUp:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/go-finance?sslmode=disable" -verbose up

migrationDrop:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/go-finance?sslmode=disable" -verbose drop

.PHONY: createdb postgres