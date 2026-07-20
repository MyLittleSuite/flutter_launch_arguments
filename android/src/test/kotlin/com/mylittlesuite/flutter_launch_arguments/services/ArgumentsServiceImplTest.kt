package com.mylittlesuite.flutter_launch_arguments.services

import android.os.Bundle
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull
import org.mockito.Mockito.mock
import org.mockito.Mockito.`when`

internal class ArgumentsServiceImplTest {

    private fun serviceWith(bundle: Bundle?): ArgumentsServiceImpl =
        ArgumentsServiceImpl(bundleInterface = { bundle })

    private fun mockBundle(key: String, value: Any?): Bundle {
        val bundle = mock(Bundle::class.java)
        `when`(bundle.containsKey(key)).thenReturn(true)
        `when`(bundle.get(key)).thenReturn(value)
        if (value is String) {
            `when`(bundle.getString(key)).thenReturn(value)
        }
        return bundle
    }

    private fun emptyBundle(key: String): Bundle {
        val bundle = mock(Bundle::class.java)
        `when`(bundle.containsKey(key)).thenReturn(false)
        return bundle
    }

    // --- getBool ---

    @Test
    fun getBool_realBooleanExtra_returnsValue() {
        val service = serviceWith(mockBundle("flag", true))
        assertEquals(true, service.getBool("flag"))
    }

    @Test
    fun getBool_stringLowercaseTrue_returnsTrue() {
        val service = serviceWith(mockBundle("flag", "true"))
        assertEquals(true, service.getBool("flag"))
    }

    @Test
    fun getBool_stringTitleCaseTrue_returnsTrue() {
        val service = serviceWith(mockBundle("flag", "True"))
        assertEquals(true, service.getBool("flag"))
    }

    @Test
    fun getBool_stringUppercaseTrue_returnsTrue() {
        val service = serviceWith(mockBundle("flag", "TRUE"))
        assertEquals(true, service.getBool("flag"))
    }

    @Test
    fun getBool_stringFalse_returnsFalse() {
        val service = serviceWith(mockBundle("flag", "false"))
        assertEquals(false, service.getBool("flag"))
    }

    @Test
    fun getBool_unparseableString_returnsNull() {
        val service = serviceWith(mockBundle("flag", "yes"))
        assertNull(service.getBool("flag"))
    }

    @Test
    fun getBool_missingKey_returnsNull() {
        val service = serviceWith(emptyBundle("flag"))
        assertNull(service.getBool("flag"))
    }

    @Test
    fun getBool_nullBundle_returnsNull() {
        val service = serviceWith(null)
        assertNull(service.getBool("flag"))
    }

    // --- getInt ---

    @Test
    fun getInt_realIntExtra_returnsValue() {
        val service = serviceWith(mockBundle("count", 42))
        assertEquals(42L, service.getInt("count"))
    }

    @Test
    fun getInt_stringExtra_returnsParsedValue() {
        val service = serviceWith(mockBundle("count", "42"))
        assertEquals(42L, service.getInt("count"))
    }

    @Test
    fun getInt_unparseableString_returnsNull() {
        val service = serviceWith(mockBundle("count", "not-a-number"))
        assertNull(service.getInt("count"))
    }

    @Test
    fun getInt_missingKey_returnsNull() {
        val service = serviceWith(emptyBundle("count"))
        assertNull(service.getInt("count"))
    }

    // --- getDouble ---

    @Test
    fun getDouble_realDoubleExtra_returnsValue() {
        val service = serviceWith(mockBundle("ratio", 3.14))
        assertEquals(3.14, service.getDouble("ratio"))
    }

    @Test
    fun getDouble_stringExtra_returnsParsedValue() {
        val service = serviceWith(mockBundle("ratio", "3.14"))
        assertEquals(3.14, service.getDouble("ratio"))
    }

    @Test
    fun getDouble_unparseableString_returnsNull() {
        val service = serviceWith(mockBundle("ratio", "not-a-number"))
        assertNull(service.getDouble("ratio"))
    }

    @Test
    fun getDouble_missingKey_returnsNull() {
        val service = serviceWith(emptyBundle("ratio"))
        assertNull(service.getDouble("ratio"))
    }

    // --- getString (regression guard) ---

    @Test
    fun getString_realStringExtra_returnsValue() {
        val service = serviceWith(mockBundle("name", "value"))
        assertEquals("value", service.getString("name"))
    }

    @Test
    fun getString_missingKey_returnsNull() {
        val service = serviceWith(emptyBundle("name"))
        assertNull(service.getString("name"))
    }
}
