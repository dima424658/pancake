#pragma once

#include <boost/beast/core.hpp>
#include <boost/beast/http.hpp>
#include <boost/beast/ssl.hpp>
#include <boost/beast/version.hpp>

#include <boost/asio/dispatch.hpp>
#include <boost/asio/strand.hpp>

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

#include <boost/config.hpp>

#include <memory>
#include <functional>
#include <vector>
#include <algorithm>
#include <iostream>
#include <string>
#include <string_view>