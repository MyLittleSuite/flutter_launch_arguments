/*
 * Copyright (c) 2024 MyLittleSuite
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

package com.mylittlesuite.flutter_launch_arguments.services

import android.os.Bundle

class ArgumentsServiceImpl(
    private val bundleInterface: () -> Bundle?,
) : ArgumentsService {

    override fun getString(key: String): String? {
        val bundle = bundleInterface()

        return bundle?.getString(key)
    }

    override fun getBool(key: String): Boolean? {
        val bundle = bundleInterface()

        return bundle?.getBoolean(key)
    }

    override fun getInt(key: String): Long? {
        val bundle = bundleInterface()

        return bundle?.getInt(key)?.toLong()
    }

    override fun getDouble(key: String): Double? {
        val bundle = bundleInterface()

        return bundle?.getDouble(key)
    }
}