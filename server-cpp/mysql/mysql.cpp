#include "mysql.hpp"
#include "query.hpp"

using namespace MySQL;

Connection::Connection(const sql::SQLString& t_hostName, const sql::SQLString& t_userName, const sql::SQLString& t_password, const sql::SQLString& t_catalog)
	: m_driver{ sql::mysql::get_driver_instance() }
{
	m_connection = std::unique_ptr<sql::Connection>(m_driver->connect(t_hostName, t_userName, t_password));
	m_connection->setSchema(t_catalog);
}

std::unique_ptr<sql::ResultSet> Connection::Query(const sql::SQLString& t_query)
{
	std::unique_ptr<sql::Statement> statement{ m_connection->createStatement() };

	return std::unique_ptr<sql::ResultSet>{ statement->executeQuery(t_query) };
}