set(${PROJECT_NAME}_hds_pqxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/basic_connection
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/basic_connection.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/binarystring
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/binarystring.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/compiler-internal-post.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/compiler-internal-pre.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/compiler-internal.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/compiler-public.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/config-internal-autotools.h
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connection
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connection.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connectionpolicy
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connectionpolicy.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connection_base
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/connection_base.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/cursor
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/cursor.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/dbtransaction
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/dbtransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/errorhandler
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/errorhandler.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/except
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/except.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/field
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/field.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/isolation
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/isolation.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/largeobject
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/largeobject.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/nontransaction
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/nontransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/notification
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/notification.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/notify-listen
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/notify-listen.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/performance.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/pipeline
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/pipeline.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/pqxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/prepared_statement
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/prepared_statement.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/result
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/result.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/robusttransaction
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/robusttransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/strconv
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/strconv.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/subtransaction
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/subtransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablereader
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablereader.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablestream
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablestream.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablewriter
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tablewriter.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transaction
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transaction_base
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transaction_base.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transactor
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/transactor.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/trigger
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/trigger.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tuple
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/tuple.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/util
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/util.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/version
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/version.hxx
CACHE INTERNAL LIST)
set(${PROJECT_NAME}_hds_pqxx_internal
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/callgate.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/libpq-forward.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/result_data.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/statement_parameters.hxx
CACHE INTERNAL LIST)
set(${PROJECT_NAME}_hds_pqxx_internal_gates
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-dbtransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-errorhandler.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-largeobject.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-notification_receiver.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-parameterized_invocation.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-pipeline.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-prepare-invocation.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-reactivation_avoidance_exemption.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-sql_cursor.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/connection-transaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/errorhandler-connection.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/icursorstream-icursor_iterator.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/icursor_iterator-icursorstream.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/pqxx_hdr_internal_gates.txt
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/result-connection.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/result-creation.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/result-sql_cursor.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/transaction-subtransaction.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/transaction-tablereader.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/transaction-tablewriter.hxx
${${PROJECT_NAME}_SOURCE_DIR}/include/pqxx/internal/gates/transaction-transactionfocus.hxx
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-compiler.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-libpq.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-public-compiler.h
CACHE INTERNAL LIST)
set(${PROJECT_NAME}_hds_cfg
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-compiler.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-libpq.h
${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-public-compiler.h
CACHE INTERNAL LIST)
set(${PROJECT_NAME}_hds ${${PROJECT_NAME}_hds_pqxx} ${${PROJECT_NAME}_hds_pqxx_internal} ${${PROJECT_NAME}_hds_pqxx_internal_gates})