'use client'

import { useState } from 'react'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/Button'
import { createGroup } from '@/app/actions/groups'

export function CreateGroupForm() {
  const [name, setName] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError(null)
    setLoading(true)

    try {
      const result = await createGroup({
        name,
      })

      if (result.error) {
        setError(result.error)
        return
      }

      setName('')
    } catch (err) {
      setError('Failed to create group')
    } finally {
      setLoading(false)
    }
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      {error && <div className="p-3 bg-red-500/20 border border-red-500 rounded text-red-300 text-sm">{error}</div>}
      <Input
        placeholder="Enter group name..."
        value={name}
        onChange={(e) => setName(e.target.value)}
        required
      />
      <Button type="submit" variant="primary" disabled={loading}>
        {loading ? 'Creating...' : 'Create Group'}
      </Button>
    </form>
  )
}
