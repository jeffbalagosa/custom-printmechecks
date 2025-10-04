function formatMoney (number: string) {
    const numberFloat: number = parseFloat(number)
    return numberFloat.toLocaleString('en-US', {style: 'decimal', minimumFractionDigits: 2, maximumFractionDigits: 2})
}

export { formatMoney }
